package board.business;

public class insert {
	public static void main(String[] args) {
		for (int i = 1; i < 203; i++) {
			System.out.println("insert into board values(" +  i + ", " + "'user"+ i + "', " + "'123', " + "'email@eamil.com', " +  "'010-0000-0000', " + 
		"'title" + i + "', " + "'content" + i + "', " + "now(), " + "'0');");
		}
		
		int p = 10;
		int a = 3;
		int totalPage = (int)Math.ceil((double)p/a);
		
		System.out.println(totalPage);
	}
}