@Repository
public Interface Project_Repository extendsJpaRepository<Project,Integer>{

	@Query("select projectname from Project where projectname = ?")

	Optional<Project> findProjectName(String projectname);
}
