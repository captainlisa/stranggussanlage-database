# Stranggussanlage


### Entities:

- Batch
- Product
- Brand
- Blueprint
- Zone 
- Pan
- Distributor
- Mold
- Strand 
- Casting Machine
- Location
- Shift
- Shiftplan
- Role
- Employee
- Employee Allocation
- Cutting Plan
- Production Plan
- Maintenance Plan

## Textual Notation

* Role (**role_id:int(3)**, *emp_allo_id:int(3)*, *employee_id:int(6)*, *work_date:date*, designation:varchar(25), is_shiftworker:boolean, has_screen:boolean)
* Employee (***employee_id:int(6)***, *work_date:date*, *emp_allo_id:int(3)*, first_name:varchar(30), last_name:varchar(30), birthday:date, phone:varchar(30), email:varchar(30))
* Employee Allocation (**emp_allo_id:int(3)**, role_id:int(3), employee_id:int(6))
* Location (**location_id:int(2)**, *employee_id:int(6)*, *work_date:date*, designation:varchar(25), max_positions:int(3))
* Shift (**shift_id:int(2)**, *employee_id:int(6)*, *work_date:date*, designation:varchar(20), timeframe:varchar(12), number_of_workers:int(3))
* Shiftplan (**employee_id:int(6)**, **work_date:date**, shift_id:int(2), location_id:int(2), role_id:int(3))
* Casting Machine (**machine_id:int(3)**, *employee_id:int(6)*, *work_date:date*, *maintenance_id:int(10)*, *production_plan_id:int(5)*, type:boolean, length:int(2))
* Maintenance Plan (**maintenance_id:int(10)**, machine_part_id:varchar(20), last_maintenance:date, batches_since:int(3))
* Pan (**pan_id:int(3)**, *maintenance_id:int(10)*, capacity:int(3))
* Distributor (**distributor_id:int(3)**, *maintenance_id:int(10)*, capacity:int(3), type:varchar(20))
* Mold (**mold_id:int(3)**, *maintenance_id:int(10)*, type:varchar(20), casting_format:varchar(25))
* Zone (**zone_id:int(3)**, *machine_id:int(3)*, cooling_temperature:varchar(5))
* Production Plan (**production_plan_id:int(5)**, batch_id:varchar(10), in_planning:boolean, in_progress:boolean, begin_production:date)
* Batch (**batch_id:varchar(10)**, *production_plan_id:int(5)*, *blueprint_id:int(3)*, *brand_designation:varchar(10)*, casting_speed:varchar(10), cooling_water_volume:varchar(20))
* Blueprint (**blueprint_id:int(3)**, designation:varchar(20), product_definition:varchar(100), casting_speed_goal:varchar(10), casting_speed_min:varchar(10), casting_speed_max:varchar(10), temperature_goal:varchar(5), temperature_min:varchar(5), temperature_max:varchar(5), casting_powder:varchar(10))
* Brand (**designation:varchar(10)**, main_substance:varchar(20), main_substance_amount:double, additional_substance:varchar(20), additional_substance_amount:double)
* Strand (**strand_id:varchar(10)**, *cutting_plan_id:int(3)*, *batch_id:varchar(10)*)
* Product (**product_id:varchar(10)**, *cutting_plan_id:int(3)*)
* Cutting Plan (**cutting_plan_id:int(3)**, length:int(3))

## SELECTS:

Liste aller Chargen geplant:
```MySQL
SELECT production_plan_id, batch_id, begin_production FROM production_plan WHERE in_planning = true;
```

Liste aller Chargen im Prozess:
```MySQL
SELECT production_plan_id, batch_id, begin_production FROM production_plan WHERE in_planning = true;
```

Liste aller Verteiler mit zugehörigen Aggregatdaten:
```MySQL
SELECT * FROM distributor;
```

Liste aller Kokillen mit zugehörigen Aggregatdaten:
```MySQL
SELECT * FROM mold;
```

Liste aller Pfannen mit zugehörigen Aggregatdaten:
```MySQL
SELECT * FROM pan;
```

Liste aller Chargen mit zugehörigen Vorschriften:
```MySQL
SELECT batch.batch_id, blueprint.blueprint_id, blueprint.designation, blueprint.product_definition, blueprint.casting_speed_goal, blueprint.temperature_goal, blueprint.casting_powder FROM batch
JOIN blueprint ON batch.blueprint_id = blueprint.blueprint_id;
```