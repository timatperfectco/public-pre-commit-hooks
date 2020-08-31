#!/usr/bin/env bash
grep 'mock_database_for_writes = False' "./prep_plan/app.py"
exit $?