class JobData{
  int id;
  String title;
  String publishDate;
  String jobDescription;
  bool isApplied = false;

  JobData({required this.title, required this.jobDescription, required this.publishDate, required this.id});

  get props =>[title, jobDescription, publishDate];

}



