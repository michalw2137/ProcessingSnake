void load() {  
  println("load start");
  headImage = loadImage("save/head.png");
  bodyImage = loadImage("save/body.png");
  JSONObject json = loadJSONObject("save/replay.json");
  
  score = json.getInt("score");
  name = json.getString("name");
  
  JSONArray dirs = json.getJSONArray("directions");
  directions = new ArrayList<>();
  for(int i=0; i<dirs.size(); i++) {
    JSONObject direction = dirs.getJSONObject(i);
    float x = direction.getFloat("x");
    float y = direction.getFloat("y");
    directions.add(new PVector(x, y));
  }
  
  JSONArray foods = json.getJSONArray("foodPositions");
  foodPositions = new ArrayList<>();;
  for(int i=0; i<foods.size(); i++) {
    JSONObject position = foods.getJSONObject(i);
    float x = position.getFloat("x");
    float y = position.getFloat("y");
    foodPositions.add(new PVector(x, y));
  }
  println(foodPositions);
  println("load end");
}
