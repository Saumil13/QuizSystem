<!-- Login screen modal frame
        ================================================== -->
      <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title" id="Login">Login</h4>
            </div>
            <form method="post" name ="Login" action="process.asp?i=Login" role="form">
            <div class="modal-body">
                <div class="form-group">
                  <label for="EMail"  class="control-label">E-Mail Address:</label>
                  <input type="email" name="email" class="form-control" placeholder="name@domain.com" id="EMail">
                </div>
                <div class="form-group">
                  <label for="password" class="control-label">Password:</label>
                  <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                </div>
            </div>
            <div class="modal-footer">
              <button type="reset" class="btn btn-default" data-dismiss="modal">Cancel</button>
              <button type="submit" class="btn btn-primary">Login</button>
            </div>
			</form>
          </div>
        </div>
      </div>
      <!-- Register screen modal frame -->
      <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="Register" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title" id="Login">Register</h4>
            </div>
              <form method="post" name ="Register" action="process.asp?i=Register" role="form">
            <div class="modal-body">
                <div class="form-group">
                  <input type="firstname" class="form-control" name="firstname"  placeholder="First Name" />
                </div>
                <div class="form-group">
                  <input type="lastname" class="form-control" name="lastname"  placeholder="Last Name" />
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="email" placeholder="E-mail" />
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Password" />
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" name="password2" placeholder="Password (confirm)" />
                </div>
            </div>
            <div class="modal-footer">
              <button type="reset" class="btn btn-default" data-dismiss="modal">Cancel</button>
              <button type="submit" class="btn btn-primary">Register</button>
            </div>
              </form>
          </div>
        </div>
      </div>