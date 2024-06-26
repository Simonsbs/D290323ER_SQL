using System.Data.SqlClient;
using System.Xml.Linq;

namespace MyShop;

internal class Program {
	
	static void Main(string[] args) {

		Console.WriteLine("Please enter your name:");
		//string name = Console.ReadLine();
		string name = "John";
		Console.WriteLine("Please enter your email:");
		//string email = Console.ReadLine();
		string email = "John@email.com";
		Console.WriteLine("Please enter your password:");
		//string password = Console.ReadLine();
		string password = "'); TRUNCATE TABLE [Users]; --";

		using (SqlConnection conn = new SqlConnection("Server=.\\SQL2022;Database=MyShop;Trusted_Connection=True;TrustServerCertificate=true;")) {
			conn.Open();
			CreateUser(conn, name, email, password);
			PrintUsers(GetAllUsers(conn));
			UpdateUser(conn,1, "Updated", "updated@updated.com", "1234");
			PrintUsers(GetAllUsers(conn));
			Console.WriteLine("Single user: " + GetUser(conn, 2));
			DeleteUser(conn, 2);
			PrintUsers(GetAllUsers(conn));

			if (GetUser(conn, email, password) != null) {
				Console.WriteLine("User logged in");
			} else {
				Console.WriteLine("Wrong username/password");
			}

		}
	}

	public static void PrintUsers(List<User> users) {
		foreach (User user in users) {
			Console.WriteLine(user.ToString());
		}
	}

	private static List<User> GetAllUsers(SqlConnection conn) {
		List<User> users = new List<User>();
		string cmdText = "SELECT * FROM [Users];";
		using (SqlCommand cmd = new SqlCommand(cmdText, conn)) {
			using (SqlDataReader reader = cmd.ExecuteReader()) {
				while (reader.Read()) {
					User newUser = User.FromReader(reader);
					users.Add(newUser);
				}
			}
		}
		return users;
	}

	private static User? GetUser(SqlConnection conn, int id) {
		string cmdText = "SELECT * FROM [Users] WHERE [ID] = @ID;";
		using (SqlCommand cmd = new SqlCommand(cmdText, conn)) {
			cmd.Parameters.AddWithValue("@ID", id);
			using (SqlDataReader reader = cmd.ExecuteReader()) {
				while (reader.Read()) {
					User newUser = User.FromReader(reader);
					return newUser;
				}
			}
		}

		return null;
	}

	private static User? GetUser(SqlConnection conn, string email, string password) {
		string cmdText = "SELECT * FROM [Users] WHERE [Email] = @Email AND [Password] = @Password;";
		using (SqlCommand cmd = new SqlCommand(cmdText, conn)) {
			cmd.Parameters.AddWithValue("@Email", email);
			cmd.Parameters.AddWithValue("@Password", password);
			using (SqlDataReader reader = cmd.ExecuteReader()) {
				while (reader.Read()) {
					User newUser = User.FromReader(reader);
					return newUser;
				}
			}
		}

		return null;
	}

	public static void CreateUser(SqlConnection conn, string name, string email, string password) {
		string cmdText = "INSERT INTO [Users] ([Name], [Email], [Password]) VALUES (@Name, @Email, @Password)";
		using (SqlCommand cmd = new SqlCommand(cmdText, conn)) {
			cmd.Parameters.AddWithValue("@Name", name);
			cmd.Parameters.AddWithValue("@Email", email);
			cmd.Parameters.AddWithValue("@Password", password);

			cmd.ExecuteNonQuery();
		}
	}

	public static void UpdateUser(SqlConnection conn, int id, string name, string email, string password) {
		string cmdText = "UPDATE [Users] SET [Name] = @Name, [Email] = @Email, [Password] = @Password WHERE [ID] = @ID";
		using (SqlCommand cmd = new SqlCommand(cmdText, conn)) {
			cmd.Parameters.AddWithValue("@ID", id);
			cmd.Parameters.AddWithValue("@Name", name);
			cmd.Parameters.AddWithValue("@Email", email);
			cmd.Parameters.AddWithValue("@Password", password);


			cmd.ExecuteNonQuery();
		}
	}
	
	public static void DeleteUser(SqlConnection conn, int id) {
		string cmdText = "DELETE FROM [Users] WHERE [ID] = @ID";
		using (SqlCommand cmd = new SqlCommand(cmdText, conn)) {
			cmd.Parameters.AddWithValue("@ID", id);
			
			cmd.ExecuteNonQuery();
		}
	}
}


public class User {
	public int ID { get; set; }

	public string Name { get; set; }

	public string Email { get; set; }

	public string Password { get; set; }

	public override string ToString() {
		return $"ID: {ID}\tName: {Name}\tEmail: {Email}\tPassword: {Password}";
	}

	public static User FromReader(SqlDataReader reader) {
		User user = new User();

		user.ID = int.Parse(reader["ID"].ToString());
		user.Name = reader["Name"].ToString();
		user.Email = reader["Email"].ToString();
		user.Password = reader["Password"].ToString();
		
		return user;
	}
}