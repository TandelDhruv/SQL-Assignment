
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
	select scientists.name as scientists,projects.name as projects,hours
	from scientists left join assignedto
		on scientists.ssn = assignedto.Scientist
	join projects on assignedto.Project = projects.Code
	order by projects.name,scientists.name;
        
-- 6.2 Select the project names which are not assigned yet
	select projects.name as project_name
    from projects left join assignedto
		on assignedto.Project = projects.Code
	where scientist is null;