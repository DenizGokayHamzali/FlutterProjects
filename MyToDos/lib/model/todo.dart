class ToDo {
  String? id;
  String? todoText;
  bool isDone;


  ToDo({ // We need {} for required keyword
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Breakfast', isDone: false),
      ToDo(id: '03', todoText: 'Check CoinMarketCap', isDone: true),
      ToDo(id: '04', todoText: 'Team Meeting'),
      ToDo(id: '05', todoText: 'Dinner with Cosmos'),
    ];
  }

}