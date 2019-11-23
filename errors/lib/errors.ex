defmodule Stack do
  use GenServer

  def start_link(init \\ []) when is_list(init) do
    GenServer.start_link(Stack, init)
  end

  # Publiczne API dla użytkowników modułu
  def pop(stack) do
    GenServer.call(stack, :pop)
  end

  def push(stack, element) do
    GenServer.cast(stack, {:push, element})
  end

  # Prywatne API dla modułu GenServer
  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {reply(error,"Stack is Empty",[]}

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:cast, element}, state) do
    {:noreply, [element | state]}
  end
end
{:ok, pid} = Stack.start_link([:hello])

GenServer.call(pid, :pop)
GenServer.cast(pid, {:push, :world})
GenServer.call(pid, :pop)
