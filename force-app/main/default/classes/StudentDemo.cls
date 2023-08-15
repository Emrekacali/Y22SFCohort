public class StudentDemo {
    integer age; //cannot be less than 18
    string name; //cannot be blank, null or 1 character

    //throw StudentException when age is less than 18 and name is blank or null or 1 character

    public StudentDemo() {
          age = 18;
    }
    public StudentDemo(Integer age, string name) {
        if (age < 18) {
            throw new StudentException('Age cannot be less than 18. Only adult students allowed.');
        } else {
            this.age = age;
        }
        
        if(String.isBlank(name) || (name != null && name.length() <= 1)) {
            throw new StudentException('NAME cannot be black, empty, null or 1 character');
          } else {
            this.name = name;
          }
        
    }
    public void show(){
        system.debug('age of student is ' + age);
        system.debug('name of student is ' + name);
    }
}

