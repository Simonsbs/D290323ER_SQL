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