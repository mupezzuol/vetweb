package com.vetweb.model.report;

public class ReportParameter {
	
	private String key;
	
	private ParameterType type;
	
	private Object value;
	
	public ReportParameter() {
	}

	public ReportParameter(String key, ParameterType type, Object value) {
		this.key = key;
		this.type = type;
		this.value = value;
	}

	public ParameterType getType() {
		return type;
	}

	public void setType(ParameterType type) {
		this.type = type;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}
