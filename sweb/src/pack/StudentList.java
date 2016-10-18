package pack;

public class StudentList {
	private int no, kor, eng;
	private String name;
	
	public StudentList(int no, String name, int kor, int eng) {
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
	}
	
	public int getNo() {
		return no;
	}
	
	public String getName() {
		return name;
	}
	
	public int getKor() {
		return kor;
	}
	
	public int getEng() {
		return eng;
	}
}
