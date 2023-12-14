name: Test different exit statuses

on:
  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:


jobs:
  first_job_exit_zero:
    runs-on: ubuntu-latest
    steps:
      - name: First job exit zero
        run: |
          echo "First job is running"
          exit 0
          echo "Should not be printed. First Job."

  second_job_exit_one:
    runs-on: ubuntu-latest
    needs: first_job_exit_zero
    steps:
      - name: Second job exit positive
        run: |
          echo "Second job is running"
          exit 1
          echo "Should not be printed. Second Job."

  third_job_exit_negative:
    runs-on: ubuntu-latest
    needs: second_job_exit_one
    steps:
      - name: Second job exit negative
        run: |
          echo "Third job is running"
          exit -1
          echo "Should not be printed. Third Job."
