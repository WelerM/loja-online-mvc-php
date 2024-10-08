<div class="container row p-0 py-2 mx-auto">


    <div class="col-md-6 col-sm-12 mx-auto py-0">

        <h5>Editar produto</h5>

        <?php require(APP_DOCUMENT_ROOT . '/core/views/components/alert.php'); ?>
        <div class="js-alert-error d-none alert alert-danger"></div>


        <?php foreach ($data as $item) : ?>

            <div style="height: fit-content; width:fit-content;" class="border p-0 text-dark">

                <img style="max-height:100px; max-width:100px" src="<?= $item['img_src']; ?>" class="img-fluid img-edit-preview">

                <div class="p-2">

                    <h5 class="m-0"><?= $item['name']; ?> </h5>
                    <p class="m-0"></p><?= 'R$ ' . number_format($item['price'], 2, ',', '.'); ?> </p>
                    <p class="m-0"><?= $item['description']; ?> </p>
                    <p class=" d-none"><?= date('d/m/Y', strtotime($item['created_at'])) . ' às ' . date('H:i', strtotime($item['created_at'])) . 'h' ?> </p>

                </div>

            </div>

        <?php endforeach ?>


        <form id="img-form" class="flex-column px-0 mt-1 py-1  " action="?a=edit_product" enctype="multipart/form-data" method="POST">


            <!-- Img input file HIDDEN-->
            <div id="container-input-file" class=" d-none mb-4">


                <label for="form-input" class="input-group-text d-flex align-items-center bg-transparent rounded-end-0 ">

                    Escolher

                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right ms-1" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8" />
                    </svg>

                </label>

                <input id="form-input" type="file" class=" custom-file-button form-control rounded-0 rounded-end-1 " name="file">


            </div>

            <!-- Img name input trigger SHOWN-->
            <button class="btn btn-edit-img d-flex align-items-center border mb-3">

                Nova imagem

                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-image ms-2" viewBox="0 0 16 16">
                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0" />
                    <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54L1 12.5v-9a.5.5 0 0 1 .5-.5z" />
                </svg>

            </button>


            <!-- Product name-->
            <div class="mb-3">

                <label for="input-img-name" class="form-label ">Nome do produto</label>

                <input required value="<?= $item['name']; ?>" id="input-img-name" type="text" class="input-name form-control" name="product-name" placeholder="Nome do produto">

            </div>

            <!-- Product price-->
            <div class="mb-3">

                <label for="input-img-name" class="form-label ">Preço do produto</label>

                <input required value="<?= 'R$ ' . number_format($item['price'], 2, ',', '.'); ?>" type="text" class="input-price form-control" name="product-price" placeholder="Preço do produto">

            </div>



            <!-- Product description-->
            <div class="form-floating mb-3">
                <textarea required id="floatingTextarea2" style="height: 100px" class="input-description form-control" name="product-description"><?= htmlspecialchars($item['description']); ?></textarea>
                <label for="floatingTextarea2">Descrição do produto</label>
            </div>




            <!-- Product link-->
            <div class="mb-3">

                <label for="link" class="form-label ">Link do produto</label>

                <input required value="<?= $item['link']; ?>" id="link" type="text" class="input-link form-control" name="product-link" placeholder="Link do produto">

            </div>





            <!-- Hidden input img id for UPDATES -->
            <div class="d-none">
                <label for="input-img-id" class="form-label d-none"></label>
                <input value="<?= $item['id']; ?>" id="input-img-id" class="form-control d-none" name="product-id" type="text">

            </div>





            <button id="btn-form-submit" type="submit" name="submit" class="btn btn-success mx-0 d-flex align-items-center justify-content-center" style="width: fit-content;">

                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-download me-1" viewBox="0 0 16 16">
                    <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5" />
                    <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708z" />
                </svg>

                Editar</button>


        </form>

    </div>

</div>