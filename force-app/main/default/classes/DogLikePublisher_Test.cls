@IsTest
private class DogLikePublisher_Test {
    @IsTest
    public static void shouldPublishDogLike(){
        DogLikePublisher.DogLikeEventWrapper dogLike = new DogLikePublisher.DogLikeEventWrapper();
        dogLike.dogPicture = 'fake.url';
        dogLike.username = 'diego@username.com';
        String result;

        Test.startTest();
        result = DogLikePublisher.publishDogLikeEvent(dogLike);
        Test.stopTest();

        Assert.areEqual('success', result, 'unsuccessful publish was unexpected');
    }

}