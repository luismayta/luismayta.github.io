coverage: coverage.help

coverage.help:
	@echo '    Coverage:'
	@echo ''
	@echo '        coverage.build        generate and view HTML coverage report'
	@echo ''

coverage.build : clean ## generate and view HTML coverage report
	py.test --cov-report html
	$(BROWSER) htmlcov/index.html