install:
	pip install -r requirements.txt

migrate:
	./manage.py makemigrations
	./manage.py migrate

mer:
	./manage.py graph_models -e -g -l dot -o modelling/orcamentos.png core

createuser:
	./manage.py createsuperuser --username='admin' --email=''

shell_num_last_proposal:
	./manage.py shell < shell/shell_num_last_proposal.py

shell_user:
	./manage.py shell < shell/shell_user.py

shell_occupation:
	./manage.py shell < shell/shell_occupation.py

shell_employee:
	./manage.py shell < shell/shell_employee.py

shell_seller:
	./manage.py shell < shell/shell_seller.py

shell_person:
	./manage.py shell < shell/shell_person.py

shell_customer:
	./manage.py shell < shell/shell_customer.py

shell_category:
	./manage.py shell < shell/shell_category.py

shell_work:
	./manage.py shell < shell/shell_work.py

shell_entry:
	./manage.py shell < shell/shell_entry.py

shell_proposal:
	./manage.py shell < shell/shell_proposal.py

shell_contract:
	./manage.py shell < shell/shell_contract.py

selenium_person:
	python core/tests/selenium/selenium_person.py

selenium_customer:
	python core/tests/selenium/selenium_customer.py

selenium_work:
	python core/tests/selenium/selenium_work.py

backup:
	./manage.py dumpdata --format=json --indent=2 > fixtures.json

load:
	./manage.py loaddata fixtures.json

run:
	./manage.py runserver

initial: install migrate createuser load

initial2: install migrate createuser shell_num_last_proposal shell_user shell_occupation shell_employee shell_seller shell_person shell_customer shell_category shell_work shell_entry shell_proposal shell_contract backup