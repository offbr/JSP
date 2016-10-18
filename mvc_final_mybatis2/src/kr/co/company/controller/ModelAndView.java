package kr.co.company.controller;

public class ModelAndView { //view 파일 호출방식과 파일명 기억
	private boolean isRedirect = false; //포워딩할지 리다이렉트할지 설정; 스프링의 기본은 포워딩;
	private String path = ""; //파일 경로명
	
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
}
