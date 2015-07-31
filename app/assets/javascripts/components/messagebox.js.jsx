var MessageBox = React.createClass({
  loadMessagesFromServer: function() {

    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleMessageSubmit: function(comment) {
 
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: comment,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadMessagesFromServer();
    pollInterval = setInterval(this.loadMessagesFromServer, this.props.pollInterval);
  },
  componentWillUnmount: function() {
    window.clearInterval(pollInterval);
  },
  render: function() {
    return (
      <div className="messageBox">
        
        <MessageList data={this.state.data} />
      </div>
    );
  }
});
