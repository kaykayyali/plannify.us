var MessageList = React.createClass({
  render: function() {
    var messageNodes = this.props.data.map(function(message, index) {
      return (
        // `key` is a React-specific concept and is not mandatory for the
        // purpose of this tutorial. if you're curious, see more here:
        // http://facebook.github.io/react/docs/multiple-components.html#dynamic-children
        <Message user={message.user} key={index}>
          {message.content}
        </Message>
      );
    });
    return (
      <div className="messageList">
        {messageNodes}
      </div>
    );
  }
});