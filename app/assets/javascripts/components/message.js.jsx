
var Message = React.createClass({
  render: function() {
    var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
    return (
      <div className="message">
        <h4>
        <div dangerouslySetInnerHTML= {{__html: this.props.user}}  />
        </h4>
        <div dangerouslySetInnerHTML={{__html: rawMarkup}} />
      </div>
    );
  }
});