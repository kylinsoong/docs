

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class Client {

	public static void main(String[] args) {

		if(args.length != 1) {
			throw new RuntimeException("Run Client via 'java Client HOSTNAME'");
		}
		
		String host = args[0];
		int port = 8081;
		
		System.out.println("Connecting to host " + host + " on port " + port + ".");
		
		try(
				Socket echoSocket = new Socket(host, port);
				PrintWriter out = new PrintWriter(echoSocket.getOutputStream(), true);
				BufferedReader in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream()));
				BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
				) {
			
			 while (true) {
				 String userInput = stdIn.readLine();
				 if ("q".equals(userInput)) {
	                    break;
	             }
				 out.println(userInput);
				 System.out.println("server: " + in.readLine());
			 }
		} catch (Exception e) {
			System.err.println("Unable to get streams from server, " + e.getMessage());
            System.exit(1);
		}
	}

}
