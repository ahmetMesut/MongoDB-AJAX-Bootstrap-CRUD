Spring MVC - MongoDB CRUD Operations with AJAX

The objective of this project,create an user information system.Starting this project these stages have been designed.

*Maven Dependencies

		<mockito-all-version>2.0.2-beta</mockito-all-version>
		<spring-test-version>4.2.6.RELEASE</spring-test-version>
		<mongo-java-driver-version>3.2.2</mongo-java-driver-version>
		<spring-data-mongodb-version>1.9.1.RELEASE</spring-data-mongodb-version>
		
		//....
*DB Connection
	
	<beans:bean id="mongo" name="mongo"
			class="org.springframework.data.mongodb.core.MongoFactoryBean">
			<beans:property name="host" value="${database.host}"/>
			<beans:property name="port" value="${database.port}"/>
	</beans:bean>
	
	<beans:bean id="mongoTemplate" name="mongoTemplate"
			class="org.springframework.data.mongodb.core.MongoTemplate">
			<beans:constructor-arg name="mongo" ref="mongo"></beans:constructor-arg>
			<beans:constructor-arg name="databaseName" value="${database.name}"></beans:constructor-arg>
	</beans:bean>
	
		<beans:bean id="PersistenceExceptionTranslationPostProcessor"
			name="PersistenceExceptionTranslationPostProcessor"
			class="org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor">
		</beans:bean>
		
*Create of User model
	
	@Document
	 public class User implements Serializable {
		private static final long serialVersionUID = -7955529160559659958L;
		
		@Id
		private String id;
		private String name;
		private String surname;
		private String phoneNumber;
		
		//getter and setter
	
*Create of UserDao interface

		public void createUser(User user);
	
		public void deleteUser(User user);
		
		public void updateUser(User user);
		
		public List<User> listUser();
		
		public User findById(String id);
		

*Create of UserDaoImpl (DB operations)

	@Autowired
	private MongoTemplate mongoTemplate;
	
	public static final String COLLECTION_NAME = "user";
	
	public UserDaoImpl() {
		System.out.println("UserDaoImpl()");
	}

	@Override
	public void updateUser(User user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(user.getId()));
		Update update = new Update();
		update.set("name", user.getName());
		update.set("surname", user.getSurname());
		update.set("phoneNumber", user.getPhoneNumber());
		mongoTemplate.updateFirst(query, update, User.class, COLLECTION_NAME);
	}
	//....

*Create of Service interface
	
	//....

*Create of ServiceImpl (for controller)

	@Autowired
	private UserDao userDao;
	
	public UserServiceImpl() {
		System.out.println("UserServiceImpl()");
	}

	@Override
	public void createUser(User user) {
		userDao.createUser(user);
	//....

*Create of UserController

	@Controller
	public class UserController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	public UserController() {
		System.out.println("UserController()");
	}
	
	
	@RequestMapping("listAllUser")
	public ModelAndView listAllUser(){
		logger.info("All users ");
		List<User> userList = userService.listUser();
		return new ModelAndView("listAllUser", "userList", userList);
	}
	//....

*Create of views

	<c:forEach items="${userList}" var="u">
		<tr>
			<th><c:out value="${u.id}" /></th>
			<th><c:out value="${u.name}" /></th>
			<th><c:out value="${u.surname}" /></th>
			<th><c:out value="${u.phoneNumber}" /></th>
			<th><a href="update?id=<c:out value='${u.id}'/>">Edit</a></th>
			<th><a href="delete?id=<c:out value='${u.id}'/>">Delete</a></th>
	   </tr>
	</c:forEach>

*Create AJAX 
		
		$( document ).ready(function() {
    	
        $("#btnEditFormPost").click(function () {
        	if(submitEditFormValid()==false){
        		return;
        	}
        	
        	var user = getUser();
        	console.log(user);
            $.ajax({
                type: "POST",
                contentType:"application/json; charset=utf-8",
                dataType:"json",
                url: "http://localhost:8080/update",
                data:JSON.stringify(user),
                success: function(response){
              		console.log(response);
              	setDataToList(response);
              	alert(response.name+" "+"was updated");
                }
            }
            );//ajax finish
        });//click finish
        

     
        $('[name=btnEdit]').on('click', function () {

            var userid =$(this).attr('userid');
        	console.log(userid);
        	setContentUserToModal(userid)
        });
        
        //.....