import static spark.Spark.*;

public class SparkTest {
    public static void main(String[] args) {
	get("/status", (req, res) -> "{\"status\":\"ok\"}");
	get("/echo/:phrase", (req, res) -> {
		return "{\"phrase\":\"" + req.params("phrase") + "\"}";
	});
    }
}
