var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function(comment, index) {
      return (
        // `key` is a React-specific concept and is not mandatory for the
        // purpose of this tutorial. if you're curious, see more here:
        // http://facebook.github.io/react/docs/multiple-components.html#dynamic-children
        <Comment user={comment.user} role={comment.role} compName={comment.companyName} comment ={comment.content} key={index}/>
      );
    });
    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
});