package com.shop.model;

public class PageMakerDTO {
	/* 시작 페이지 */
	private int startPage;

	/* 끝 페이지 */
	private int endPage;

	/* 이전 페이지, 다음 페이지 존재유무 */
	private boolean prev, next;

	/* 전체 회원 수 */
	private int total;

	/* 현재 페이지, 페이지당 회원 표시수 정보 */
	private Criteria cri;

	/* 생성자 */
	public PageMakerDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;

		/* 마지막 페이지 구하는 코드 */
		// Math.ceil() 함수
		// 현재의 페이지를 10으로 나눈 후 그값 반올림하고 다시 10을 곱해줌
		// int 형변환 하는 이유 = Math.ceil()메소드의 반환 타입이 double이라
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		/* 시작 페이지 구하는 코드 */
		// 위에서 구해진 마지막 페이지 수 -9 해줌.
		this.startPage = this.endPage - 9;

		/* 전체 마지막 페이지 */
		// 전체 회원(total)을 화면에 표시될 게시물 수(amount)로 나눈 후 반올림
		int realEnd = (int) (Math.ceil(total * 1.0 / cri.getAmount()));

		// IF 조건문을 통하며 endPage가 realEnd보다 큰 경우 endPage에 realend값을 저장
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		// 이전 페이지 존재 여부 '시작페이지(startPage)'가 1보다 크다면 존재하기 때문에 startPage>1 이면 true가 저장
		this.prev = this.startPage > 1;

		// 다음 페이지 존재 여부 '전체 페이지 마지막 번호'(realEnd)보다 '화면에 보이는 마지막 번호(endPage)'가 작다면
		// 존재하기 때문에 endPage <realEnd 이면 true가 저장
		this.next = this.endPage < realEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMakerDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}

}
