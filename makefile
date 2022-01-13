up:
	docker-compose up

stop:
	docker-compose stop

bash:
	docker-compose exec app /bin/bash

ps:
	docker-compose ps

createsuperuser:
	docker exec -it django-app bash -c "python manage.py createsuperuser"

migrate:
	docker exec -it django-app bash -c "python manage.py makemigrations ${SETTINGS}"
	docker exec -it django-app bash -c "python manage.py migrate ${SETTINGS}"

populate:
	docker exec -it django-app bash -c "python manage.py populate_db ${SETTINGS}"

flush:
	docker exec -it django-app bash -c "python manage.py flush ${SETTINGS}"

recreate:
	make flush
	make migrate
	make populate

bash:
	docker-compose exec app /bin/bash

logs:
	docker-compose logs -f
