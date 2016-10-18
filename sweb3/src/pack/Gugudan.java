package pack;

public class Gugudan {
	private static Gugudan gugudan = new Gugudan();
	
	public static Gugudan getInstance(){
		return gugudan;
	}
	
	public Gugudan() {
		
	}
	
	public int[] computa(int dan){
		int[] gu = new int[9];
		for (int i = 1; i < 10; i++) {
			gu[i - 1] = dan * i;
		}
		return gu;
	}
}
