class Updatereqdto{
  final String? title;
  final String? content;

  Updatereqdto(this.title, this.content);

  Map<String, dynamic> toJson()=>{
    "title" : title,
    "content" : content,
  };
}