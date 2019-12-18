    use Dancer2;
    use Template;


get '/' => sub {
  return 'Hello World!';
};
 

start;
