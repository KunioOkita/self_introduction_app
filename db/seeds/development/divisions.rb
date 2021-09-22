# coding: utf-8
# departments
department_division_map = {
  "開発部" => ["〇〇課", "XX課"]
}
department_division_map.each do |department_name, divisions|
  department = Department.create(name: department_name)
  divisions.each do |division|
    Division.create(department_id: department.id, name: division)
  end
end
