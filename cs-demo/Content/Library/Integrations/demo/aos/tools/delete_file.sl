namespace: Integrations.demo.aos.tools
flow:
  name: delete_file
  inputs:
    - host: 10.0.46.82
    - username: root
    - password: admin@123
    - filename: accountservice.war
  workflow:
    - delete_file:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - command: "${'cd '+get_sp('script_location')+' && rm -f '+filename}"
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      delete_file:
        x: 286
        y: 238
        navigate:
          a95e8455-ffc1-340f-d78e-ccc411284c87:
            targetId: 6268622b-6f1d-de54-a3a3-f35097765854
            port: SUCCESS
    results:
      SUCCESS:
        6268622b-6f1d-de54-a3a3-f35097765854:
          x: 538
          y: 240
