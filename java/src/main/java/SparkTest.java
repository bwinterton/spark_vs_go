import static spark.Spark.*;

public class SparkTest {

    public static void main(String[] args) {

	port(8000); // To make consistent with Go example

	get("/status", (req, res) -> "{\"status\":\"ok\"}");
	get("/echo/:phrase", (req, res) -> {
		return "{\"phrase\":\"" + req.params("phrase") + "\"}";
	});

    }

}
