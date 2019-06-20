
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class Server extends Thread{
	
	static final int PORT_NUMBER = 8081;
	
	protected Socket socket;
	
	public Server(Socket socket) {
		this.socket = socket;
		System.out.println("New client connected from " + socket.getInetAddress().getHostAddress());
		start();
	}
	
	public void run() {
		
		try(InputStream in = socket.getInputStream();
			OutputStream out =	socket.getOutputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(in));){
			
			String request;
			while ((request = br.readLine()) != null) {
				System.out.println("Message received: " + request);
				request += '\n';
				out.write(request.getBytes());
			}
		} catch (IOException e) {
			System.out.println("Unable to get streams from client, " + e.getMessage());
		}
	}

	public static void main(String[] args) throws IOException {

		ServerSocket server = null;
		try {
			server = new ServerSocket(PORT_NUMBER);
			while (true) {
				new Server(server.accept());
			}
		} catch (IOException e) {
			System.out.println("Unable to start server. " + e.getMessage());
		} finally {
			if (server != null) {
				server.close();
			}
		}
	}

}
