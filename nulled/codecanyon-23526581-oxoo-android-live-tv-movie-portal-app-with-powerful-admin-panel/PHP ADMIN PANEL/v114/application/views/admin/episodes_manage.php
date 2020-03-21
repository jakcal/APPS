<div class="card">

  <div class="row">         
    <div class="col-md-12">
     <a class="btn btn-sm btn-primary waves-effect mb-20" href="<?php echo base_url('admin/seasons_manage/').$param1; ?>"> <span class="btn-label"><i class="fa fa-arrow-left"></i></span>Back to Seasons</a><br><br>
<div id="output"></div>
        <div class="panel panel-border panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">Upload Video</h3>
            </div>
            <div class="panel-body">
          <div class="col-md-6 col-md-offset-3">
          <div class="animated-radio-button radio-inline">
          <label>
            <input type="radio" name="radio-input" id="upload-active" ><span class="label-text">Upload</span>
          </label>
          <label>
            <input type="radio" name="radio-input"  id="link-active" checked><span class="label-text">From URL</span>
          </label>
        </div>

          <div id="upload_section" style="display: none;">
            <form action="<?php echo base_url('admin/episodes_upload'); ?>" method="post" enctype="multipart/form-data" id="MyUploadForm">
              <input type="hidden" name="videos_id" value="<?php echo $param1; ?>">
              <input type="hidden" name="seasons_id" value="<?php echo $param2; ?>">
              <div class="form-group">
                <label class="control-label" >Episodes Name</label>
                <input id="episodes_name_upload" type="text" name="episodes_name" class="form-control" placeholder="Episode-1" required="">
              </div>
              <div class="form-group">
                <label class="control-label">Thumbnail</label>
                <input name="thumbnail" id="thumbnail" type="file" />
              </div> 
              <div class="form-group">
                <label class="control-label">Select Video</label>
                <input name="FileInput" id="FileInput" type="file" />
              </div>

                          
            <button type="submit" class="btn btn-sm btn-primary waves-effect"> <span class="btn-label"><i class="fa fa-upload"></i></span>Upload Video </button><br><br></form>
            <div id="progressbox">
              <div class="progress progress-striped active">
                <div id="progressbar" class="progress-bar" style="width: 0%;"></div>                    
              </div>
              <center>
              <div id="statustxt">0%</div>
              </center>
            </div>
            <div id="output"></div>
          </form>
          </div>
            <div id="link_section" >
              <form action="<?php echo base_url('admin/episodes_url'); ?>" method="post" enctype="multipart/form-data" id="MyUploadForm2">
              <input type="hidden" name="videos_id" value="<?php echo $param1; ?>">
              <input type="hidden" name="seasons_id" value="<?php echo $param2; ?>">
              <div class="form-group">
                <label class="control-label" >Episodes Name</label>
                <input id="episodes_name" type="text" name="episodes_name" class="form-control" placeholder="Episode-1" required="">
              </div>
              <div class="form-group">
                <label class="control-label">Thumbnail</label>
                <input name="thumbnail" id="thumbnail2" type="file"/>
              </div>
              <div class="form-group">
                <label class="control-label">Source</label>
                    <select class="form-control" name="type" id="selected-source">
                      <option value="youtube" selected>Youtube URL</option>
                      <option value="mp4">MP4 From URL</option>
                      <option value="mkv">MKV From URL</option>
                      <option value="amazone">Amazone S3</option>                    
                      <option value="webm">WEBM From URL</option>
                      <option value="hls">HLS/M3U8 From URL</option>
                      <option value="embed">Embed URL</option>
                      <option value="vimeo">Vimeo</option>
                    </select>
              </div>
              <div class="form-group" id="_source1">
                <label class="control-label" >URL</label>
                <input id="video_url" type="url" name="url" class="form-control" placeholder="http://server-2.com/movies/titalic.mp4" required=""><br>
              <button class="btn btn-sm btn-primary waves-effect" type="submit" id="submit_url">Submit </button>
            </div>
            </form>             
        </div>
    </div>
  </div></div>
  <div class="row"><div class="col-md-12">
      <div class="panel panel-border panel-primary">
            <div class="panel-heading">
              <h3 class="panel-title">Episodes List</h3>
            </div>
            <div class="panel-body">               
            <table class="table table-bordered" id="video-list">
              <thead>
                <tr>
                  <th>Thumbnail</th>
                  <th>Episode Name</th>
                  <th>Source</th>
                  <th>URL</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php $episodes = $this->db->get_where('episodes', array('videos_id'=> $param1,'seasons_id'=>$param2))->result_array();
                      foreach($episodes as $video_file):
                 ?>

                 <tr id="row_<?php echo $video_file['episodes_id']; ?>">
                  <td><img width="80" class="img img-responsive" src="<?php echo $this->common_model->get_episode_image_url($param1,$video_file['episodes_id']); ?>"></td>
                  <td><strong><?php echo $video_file['episodes_name']; ?></strong></td>
                  <td><strong><?php echo $video_file['file_source']; ?></strong></td>
                  <td><?php echo $video_file['file_url']; ?></a></td>
                  <td>
                    <div class="btn-group">
                      <button type="button" class="btn btn-white btn-sm dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a class="dropdown-item" title="Delete" href="#" onclick="delete_row('episodes',<?php echo urldecode($video_file['episodes_id']);?>)" class="delete">Delete</a> </li>
                      </ul>
                    </div>
                  </td>
                </tr>             
              <?php endforeach; ?>
            </tbody>
            </table>         
        </div>
      </div>
    </div>
  </div>
</div>
<!-- <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> -->
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/jquery.form.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        var options = {
            //target:   '#output',   // target element(s) to be updated with server response 
            beforeSubmit: beforeSubmit, // pre-submit callback 
            success: afterSuccess, // post-submit callback 
            uploadProgress: OnProgress, //upload progress callback 
            resetForm: true // reset the form after successful submit 
        };

        var options2 = {
            //target:   '#output',   // target element(s) to be updated with server response 
            beforeSubmit: beforeSubmit2, // pre-submit callback 
            success: afterSuccess2, // post-submit callback 
            uploadProgress: OnProgress2, //upload progress callback 
            resetForm: true // reset the form after successful submit 
        };

        $('#MyUploadForm2').submit(function() {
            $(this).ajaxSubmit(options2);
            // always return false to prevent standard browser submit and page navigation 
            return false;
        });

        $('#MyUploadForm').submit(function() {
            $(this).ajaxSubmit(options);
            // always return false to prevent standard browser submit and page navigation 
            return false;
        });


        //function after succesful file upload (when server response)
        function afterSuccess(data) {
            var response = JSON.parse(data);
            var status = response.status;
            $('#submit-btn').show(); //hide submit button
            //$('#loading-img').hide(); //hide submit button
            $('#progressbox').delay(1000).fadeOut(); //hide progress bar
            if (status == 'success') {
                $('#video-list').append(response.video_info);
                swal('Good job!','Video upload successfully ','success');
                //location.reload();
            } else {
                //$("#output").html(response.errors);
                swal('OPPS!',response.errors ,'error');
            }
        }

        //function after succesful file upload (when server response)
        function afterSuccess2(data) {
            var response = JSON.parse(data);
            //alert(data);
            var status = response.status;
            $("submit_url").text('Submit');
            if (status == 'success') {
                $('#video-list').append(response.video_info);
                swal('Good job!','Video upload successfully ','success');
                //location.reload();
            } else {
                //$("#output").html(response.errors);
                swal('OPPS!',response.errors ,'error');
            }
        }

        //function to check file size before uploading.
        function beforeSubmit() {
            //check whether browser fully supports all File API
            if (window.File && window.FileReader && window.FileList && window.Blob) {

                if (!$('#FileInput').val()) //check empty input filed
                {
                    swal('OPPS!',"Please select at least one video file!!" ,'error');
                    //$("#output").html("Please select at least one video file!!");
                    return false
                }

                if ($('#thumbnail').val()) //check empty input filed
                {

                  var fsize = $('#thumbnail')[0].files[0].size; //get file size
                  var ftype = $('#thumbnail')[0].files[0].type; // get file type


                  //allow file types 
                  switch (ftype) {
                      case 'image/jpeg':
                      case 'image/pjpeg':
                      case 'image/png':
                      break;
                      default:
                          swal('OPPS!',"<b>" + ftype + "</b> Unsupported file type/format/extention!" ,'error');
                          return false
                  }

                  //Allowed file size is less than 5 MB (1048576)
                  if (fsize > 5000000) {
                      $("#output").html("<b>" + bytesToSize(fsize) + "</b> Too big file! <br />File is too big, it should be less.");
                      return false
                  }
                }

                var fsize = $('#FileInput')[0].files[0].size; //get file size
                var ftype = $('#FileInput')[0].files[0].type; // get file type


                //allow file types 
                switch (ftype) {
                    case 'video/webm':
                    case 'video/msvideo':
                    case 'video/x-msvideo':
                    case 'video/mp4':
                    case 'video/mpeg':
                    case 'video/x-matroska':
                    case 'application/x-mpegurl':
                    break;
                    default:
                        swal('OPPS!',"<b>" + ftype + "</b> Unsupported file type/format/extention!" ,'error');
                        //$("#output").html("<b>" + ftype + "</b> Unsupported file type!");
                        return false
                }

                //Allowed file size is less than 5 MB (1048576)
                if (fsize > 5000242880) {
                    $("#output").html("<b>" + bytesToSize(fsize) + "</b> Too big file! <br />File is too big, it should be less.");
                    return false
                }

                $('#submit-btn').hide(); //hide submit button
                $('#loading-img').show(); //hide submit button
                $("#output").html("");
                $('#progressbar').width('0%') //update progressbar percent complete
                $('#statustxt').html('0%'); //update status text  
            } else {
                //Output error to older unsupported browsers that doesn't support HTML5 File API
                $("#output").html("Please upgrade your browser, because your current browser lacks some new features we need!");
                return false;
            }
        }

        //function to check file size before uploading.
        function beforeSubmit2() {
            //check whether browser fully supports all File API
            if (window.File && window.FileReader && window.FileList && window.Blob) {

                if (!isUrl($('#video_url').val())) //check empty input filed
                {
                    swal('OPPS!',"Please enter a valid URL!!" ,'error');
                    return false
                }

                if (!$('#thumbnail2').val()) //check empty input filed
                {
                    swal('OPPS!',"Please select at least one image file!!" ,'error');
                    //$("#output").html("Please select at least one video file!!");
                    return false
                }
                if ($('#thumbnail2').val()) //check empty input filed
                {

                  var fsize = $('#thumbnail2')[0].files[0].size; //get file size
                  var ftype = $('#thumbnail2')[0].files[0].type; // get file type


                  //allow file types 
                  switch (ftype) {
                      case 'image/jpeg':
                      case 'image/pjpeg':
                      case 'image/png':
                      break;
                      default:
                          swal('OPPS!',"<b>" + ftype + "</b> Unsupported file type/format/extention!" ,'error');
                          return false
                  }

                  //Allowed file size is less than 5 MB (1048576)
                  if (fsize > 5000000) {
                      $("#output").html("<b>" + bytesToSize(fsize) + "</b> Too big file! <br />File is too big, it should be less.");
                      return false
                  }
                }
                $("submit_url").text('Uploading..'); 
            } else {
                //Output error to older unsupported browsers that doesn't support HTML5 File API
                $("#output").html("Please upgrade your browser, because your current browser lacks some new features we need!");
                return false;
            }
        }


        //progress bar function
        function OnProgress(event, position, total, percentComplete) {
            //Progress bar
            $('#progressbox').show();
            $('#progressbar').width(percentComplete + '%') //update progressbar percent complete
            $('#statustxt').html(percentComplete + '%'); //update status text
            if (percentComplete > 50) {
                $('#statustxt').css('color', '#000'); //change status text to white after 50%
            }
        }

        //progress bar function
        function OnProgress2(event, position, total, percentComplete) {
        }

        //function to format bites bit.ly/19yoIPO
        function bytesToSize(bytes) {
            var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
            if (bytes == 0) return '0 Bytes';
            var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
            return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
        }

    });
</script>
<script type="text/javascript" src="<?php echo base_url() ?>assets/plugins/parsleyjs/dist/parsley.min.js"></script>

<script>
    $(document).ready(function() {
      $("#upload-active").click(function(){
        $("#upload_section").show();
        $("#link_section").hide();
      });
      $("#link-active").click(function(){
        $("#upload_section").hide();
        $("#link_section").show();
      });
    });
</script>
<script>
  function isUrl(s) {
      var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
      return regexp.test(s);
  }
</script>
<script src="<?php echo base_url() ?>assets/plugins/bootstrap-filestyle/src/bootstrap-filestyle.min.js" type="text/javascript"></script>
<script>
    jQuery(document).ready(function() {
        $(":file#FileInput").filestyle({
            input: true,
            text:'Select Video'
        });
        $(":file#thumbnail").filestyle({
            input: true,
            text:'Select Photo'
        });
        $(":file#thumbnail2").filestyle({
            input: true,
            text:'Select Photo'
        });
    });
</script>

