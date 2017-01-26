def wait_until(timeout = DEFAULT_WAIT_TIME)
  Timeout.timeout(timeout) do
    sleep(0.1) until value = yield
    value
  end
end