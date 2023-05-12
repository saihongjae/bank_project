package bank.dto;


public class QnaDTO {

		String id;
		String title;
		String content;
		String quastDate;
		String answer;
		String answer_date;
		
		public String getAnswer() {
			return answer;
		}
		public void setAnswer(String answer) {
			this.answer = answer;
		}
		public String getAnswer_date() {
			return answer_date;
		}
		public void setAnswer_date(String answer_date) {
			this.answer_date = answer_date;
		}
		
		public String getQuastDate() {
			return quastDate;
		}
		public void setQuastDate(String quastDate) {
			this.quastDate = quastDate;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
	}
