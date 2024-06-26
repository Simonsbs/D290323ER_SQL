using System.Data.SqlClient;

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
		}
	}

	public static void CreateUser(SqlConnection conn, string name, string email, string password) {
		string cmdText = $"INSERT INTO [Users] ([Name], [Email], [Password]) VALUES ('{name}', '{email}', '{password}')";
		using (SqlCommand cmd = new SqlCommand(cmdText, conn)) {
			cmd.ExecuteNonQuery();
		}
	}
}
