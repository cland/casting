package com.cland.casting


	public enum ProductionStatus{
		OPEN_CANDIDATES_REQUIRED("Open - Candidates Required"),
		OPEN_AUDITION_IN_PROGRESS("Open - Audition In Progress"),
		CLOSED("Closed")

		final String value;
		
		ProductionStatus(String value) {
			this.value = value;
		}
		
		String toString(){
			value;
		}
		
		String getKey(){
			name()
		}

		static list() {
			[OPEN_CANDIDATES_REQUIRED, OPEN_AUDITION_IN_PROGRESS, CLOSED]
		}

	} //end Enum

