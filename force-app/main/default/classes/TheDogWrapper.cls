public class TheDogWrapper {

	public Weight weight {get;set;} 
	public Weight height {get;set;} 
	public Integer id {get;set;} 
	public String name {get;set;} 
	public String bred_for {get;set;} 
	public String breed_group {get;set;} 
	public String life_span {get;set;} 
	public String temperament {get;set;} 
	public String origin {get;set;} 
	public String reference_image_id {get;set;} 
	public String country_code {get;set;} 
	public String description {get;set;} 
	public String history {get;set;} 

	public TheDogWrapper(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'weight') {
						weight = new Weight(parser);
					} else if (text == 'height') {
						height = new Weight(parser);
					} else if (text == 'id') {
						id = parser.getIntegerValue();
					} else if (text == 'name') {
						name = parser.getText();
					} else if (text == 'bred_for') {
						bred_for = parser.getText();
					} else if (text == 'breed_group') {
						breed_group = parser.getText();
					} else if (text == 'life_span') {
						life_span = parser.getText();
					} else if (text == 'temperament') {
						temperament = parser.getText();
					} else if (text == 'origin') {
						origin = parser.getText();
					} else if (text == 'reference_image_id') {
						reference_image_id = parser.getText();
					} else if (text == 'country_code') {
						country_code = parser.getText();
					} else if (text == 'description') {
						description = parser.getText();
					} else if (text == 'history') {
						history = parser.getText();
					} else {
						System.debug(LoggingLevel.WARN, 'TheDogWrapper consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Weight {
		public String imperial {get;set;} 
		public String metric {get;set;} 

		public Weight(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'imperial') {
							imperial = parser.getText();
						} else if (text == 'metric') {
							metric = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Weight consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static List<TheDogWrapper> parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return arrayOfTheDogWrapper(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	
    private static List<TheDogWrapper> arrayOfTheDogWrapper(System.JSONParser p) {
        List<TheDogWrapper> res = new List<TheDogWrapper>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new TheDogWrapper(p));
        }
        return res;
    }



















}