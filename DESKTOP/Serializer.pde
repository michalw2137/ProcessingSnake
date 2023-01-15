
void serialize() {  
  JSONArray directions = new JSONArray();
  for(PVector direction : snake.directions) {
    JSONObject json = new JSONObject();
    json.setFloat("x", direction.x);
    json.setFloat("y", direction.y);
    directions.append(json);
  }
  
  JSONArray foods = new JSONArray();
  for(PVector position : foodPositions) {
    JSONObject json = new JSONObject();
    json.setFloat("x", position.x);
    json.setFloat("y", position.y);
    foods.append(json);
  }
  
  JSONObject save = new JSONObject();
  save.setString("name", nameField.getName());
  save.setInt("score", snake.size);
  save.setJSONArray("directions", directions);
  save.setJSONArray("foodPositions", foods);

  saveJSONObject(save, "save/replay.json");

  headImage.save("save/head.png");
  bodyImage.save("save/body.png");
}
