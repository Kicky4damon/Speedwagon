package kr.co.hong.DTO;

public class CategoryDTO {
	private int id;
	private int board_num;
	
	@Override
	public String toString() {
		return "CategoryDTO [id=" + id + ", board_num=" + board_num + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
}
