class Context
{
  State state;
  public Context(State st)
  {
    state = st;
  }
  public State getState()
  {
    return this.state;
  }
  public void setState(State st)
  {
    this.state = st;
  }
}