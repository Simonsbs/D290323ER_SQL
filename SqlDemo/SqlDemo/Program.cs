using System.Data.SqlClient;

internal class Program
{
	private static void Main(string[] args)	{
		string connectionString = "Server=TEST_ENV\\SQL2022;Database=NW2;Trusted_Connection=True;TrustServerCertificate=true;";

		SqlConnection connection = new SqlConnection(connectionString);

		connection.Open();

		SqlCommand cmd = new SqlCommand("SELECT [CustomerID], [City], [CompanyName] FROM [Customers];", connection);

		SqlDataReader reader = cmd.ExecuteReader();

		while (reader.Read()) {
			Console.WriteLine(reader["CompanyName"]);
        }
	}
}


//    * HW
//* Create a table called 'Users' with the following columns: ID, Name, Email, Password
//* using a console application, do the following:
//* 1. Create a new user
//* 2. Update a user
//* 3. Delete a user
//* 4. Get all users
//* 5. Get a user by ID