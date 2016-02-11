clean:
	@find . -name "*.pyc" | xargs rm -rf
	@find . -name "*.pyo" | xargs rm -rf
	@find . -name "__pycache__" -type d | xargs rm -rf

test: clean
	py.test -x tests.py

test-debug: clean
	py.test -x --pdb tests.py

requirements: clean
	pip install -r requirements-dev.txt

sdist: test
	@python setup.py sdist upload
