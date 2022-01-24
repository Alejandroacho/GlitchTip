up:
	docker-compose up

stop:
	docker-compose stop

bash:
	docker-compose exec app /bin/bash

ps:
	docker-compose ps

createsuperuser:
	docker exec -it glitchtip-django-app bash -c "python manage.py createsuperuser"

migrate:
	docker exec -it glitchtip-django-app bash -c "python manage.py makemigrations ${SETTINGS}"
	docker exec -it glitchtip-django-app bash -c "python manage.py migrate ${SETTINGS}"

flush:
	docker exec -it glitchtip-django-app bash -c "python manage.py flush ${SETTINGS}"

recreate:
	make flush
	make migrate

logs:
	docker-compose logs -f
