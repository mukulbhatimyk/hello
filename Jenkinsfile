pipeline {
   agent any
   
   stages {
	stage{'Clone Repository'} {
	
	checkout scm
	}

	stage{'Build'} {
	
	ant all
	}
  }
}
	
		 


