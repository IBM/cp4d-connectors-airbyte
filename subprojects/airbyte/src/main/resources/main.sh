trap "echo 'received ABRT'; exit 1;" ABRT
(eval "$AIRBYTE_ENTRYPOINT ARGS" 2> STDERR_PIPE_FILE > STDOUT_PIPE_FILE) &
CHILD_PID=$!
echo "Waiting on CHILD_PID $CHILD_PID"
wait $CHILD_PID
EXIT_STATUS=$?
echo "EXIT_STATUS: $EXIT_STATUS"
exit $EXIT_STATUS
