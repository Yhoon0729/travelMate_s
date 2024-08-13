package model;

public class AdmActAnal {
	
	String act;
	String count;
	
	public AdmActAnal() {}
	
	public AdmActAnal(String act, String count) {
		super();
		this.act = act;
		this.count = count;
	}

	@Override
	public String toString() {
		return "AdmActAnal [act=" + act + ", count=" + count + "]";
	}

	public String getAct() {
		return act;
	}

	public void setAct(String act) {
		this.act = act;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
	
	
	
}
