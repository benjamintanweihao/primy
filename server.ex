defmodule Server do

  def start do
    pid  = spawn(__MODULE__, :loop, [1, 1])
    :yes = :global.register_name("server", pid)
  end

  def loop(number, highest_prime) do
    receive do
      {:request, worker_pid} ->
        send(worker_pid, number)
        loop(number+1, highest_prime)

      {true, candidate_highest_prime} ->
        if candidate_highest_prime > highest_prime do
          IO.puts candidate_highest_prime
          loop(number, candidate_highest_prime)
        else
          loop(number, highest_prime)
        end

      {false, _} ->
        loop(number, highest_prime)
        
    end
  end

end
