package com.hidear.exam.modular.model.question;

import java.util.Date;

public class QuestionHistory implements Comparable<QuestionHistory> {

	/**
	 * 记录试卷id：-1找不到试卷；0练习题
	 */
	private int examPaperId;
	private int questionId;
	private Date time;
	private String answer;
	private String myAnswer;
	private boolean isRight;
	private int questionTypeId;
	private int pointId;
	/**
	 * 来源，强化练习则设置成1
	 */
	private int from;

	@Override
	public String toString() {
		return "QuestionHistory{" +
				"examPaperId=" + examPaperId +
				", questionId=" + questionId +
				", time=" + time +
				", answer='" + answer + '\'' +
				", myAnswer='" + myAnswer + '\'' +
				", isRight=" + isRight +
				", questionTypeId=" + questionTypeId +
				", pointId=" + pointId +
				", from=" + from +
				'}';
	}

	public QuestionHistory(int examPaperId, int questionId, Date time, String answer, String myAnswer, boolean isRight, int questionTypeId, int pointId, int from) {
		this.examPaperId = examPaperId;
		this.questionId = questionId;
		this.time = time;
		this.answer = answer;
		this.myAnswer = myAnswer;
		this.isRight = isRight;
		this.questionTypeId = questionTypeId;
		this.pointId = pointId;
		this.from = from;
	}

	public QuestionHistory() {

	}

	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getPointId() {
		return pointId;
	}
	public void setPointId(int pointId) {
		this.pointId = pointId;
	}
	public int getQuestionTypeId() {
		return questionTypeId;
	}
	public void setQuestionTypeId(int questionTypeId) {
		this.questionTypeId = questionTypeId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getExamPaperId() {
		return examPaperId;
	}
	public void setExamPaperId(int examPaperId) {
		this.examPaperId = examPaperId;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getMyAnswer() {
		return myAnswer;
	}
	public void setMyAnswer(String myAnswer) {
		this.myAnswer = myAnswer;
	}
	public boolean isRight() {
		return isRight;
	}
	public void setRight(boolean isRight) {
		this.isRight = isRight;
	}
	@Override
	public int compareTo(QuestionHistory o) {
		// TODO Auto-generated method stub
		if(this.time.getTime() > o.getTime().getTime())
			return 1;
		else if(this.time.getTime() < o.getTime().getTime())
			return -1;
		else return 0;
	}
}
