postgres:
	docker run --name postgres-12 -e POSTGRES_PASSWORD=secret -e POSTGRES_USER=root -p 5432:5432 -d postgres:12-alpine
createDB:
	docker exec -it postgres-12 createdb simpleBank --username=root --owner=root
dropDB:
	docker exec -it postgres-12 dropdb simpleBank
connectDB:
	docker exec -it postgres-12  psql simpleBank
migrateUp:
	migrate -database "postgresql://root:secret@localhost:5432/simpleBank?sslmode=disable" -path "db/migration" -verbose up
migrateDown:
	migrate -database "postgresql://root:secret@localhost:5432/simpleBank?sslmode=disable" -path "db/migration" -verbose down
.PHONY: createDB dropDB connectDB postgres migrateUp migrateDown