part of exercise8;

List<String> q1Mots = [
     'violently','talks','your mother','weird','this','sarcastic', 'you-know-who',
     'flirts with', 'nice', 'brutally', 'aweful', 'nice', 'things', 'silently', 'talks to',
     'batman', 'hugs', 'banal', 'awesome', 'is', 'steals', 'recklessly',
     'push', 'throw', 'the zombie', 'away'];

List<Map> q2Associations = [
     {'name': 'HPA', 'description': 'Happy people association'},
     {'name': 'SPA', 'description': 'Sad people association'},
     {'name': 'AOFI', 'description': 'Association of faked indifference'}];

List<Map> q2Members = [
     {'association': 'HPA', 'firstName': 'Bob', 'lastName': 'Sley', 'email': 'BS@gmail.com'},
     {'association': 'AOFI', 'firstName': 'Buzz', 'lastName': 'Killington', 'email': 'BK@gmail.com'},
     {'association': 'SPA', 'firstName': 'Itoff', 'lastName': 'Meyachev', 'email': 'IM@gmail.com'}];

List<List<String>> q4 =
     [['1','0','1','1','1','0','0','0'],
      ['1','0','1','1','0','0','0','1'],
      ['1','0','0','1','0','1','0','1'],
      ['0','0','0','0','0','1','0','0'],
      ['0','1','1','0','0','1','1','0']];

List<List<int>> q5 =
     [[2,6,3,1],
      [11,7,4,15],
      [13,12,5,8],
      [9,14,10, ]];

//simple fonction qui print une matrice ligne par ligne
printMatrix(var matrix){;
  for(var i = 0; i < matrix.length; i++){
    print(matrix[i]);}}

//simple fonction qui crée une matrice de booléen de grosseur ixj remplie par true ou par false
createFilledBoolMatrix(var i, var j, var tf){
  var bMatrix = new List<List<bool>>.generate(j, (_) => new List<bool>.filled(i, tf), growable: false);
  return bMatrix;
}
