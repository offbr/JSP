package pack;

import java.util.List;

public class Main {

	public static void main(String[] args) {
		ProcessDao dao = ProcessDao.getInstance();
		
		try {
			/*
			System.out.println("\n자료 추가");
			DataDto dataDto = new DataDto();
			dataDto.setCode("101");
			dataDto.setSang("초코우유");
			dataDto.setSu("5");
			dataDto.setDan("1000");
			if(dao.insertData(dataDto) > 0) System.out.println("성공");
			*/
			/*
			System.out.println("\n자료 수정");
			DataDto dataDto = new DataDto();
			dataDto.setCode("100");
			dataDto.setSang("바나나우유");
			dao.updateData(dataDto);
			*/
			System.out.println("\n자료 삭제");
			boolean b = dao.deleteData(101);
			if(b){
				System.out.println("삭제 성공");
			}else{
				System.out.println("삭제 실패");
			}
			
			System.out.println("\n전체 자료 읽기");
			List<DataDto> list = dao.selectDataAll();
			for (DataDto s : list) {
				System.out.println(s.getCode() + " " + s.getSang() + " " + s.getSu() + " " + s.getDan());
			}
			
			System.out.println("\n부분 자료 읽기");
			DataDto s = dao.slelectDataPart("1");
			System.out.println(s.getCode() + " " + s.getSang() + " " + s.getSu() + " " + s.getDan());
		} catch (Exception e) {
			System.out.println("err : " + e);
		}
	}

}
